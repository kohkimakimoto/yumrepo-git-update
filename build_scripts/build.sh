#!/usr/bin/env bash
set -e

git_version=2.14.1

if [ -z "$DOCKER_IMAGE" ]; then
    # Get the directory path.
    SOURCE="${BASH_SOURCE[0]}"
    while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
    scripts_dir="$( cd -P "$( dirname "$SOURCE" )/" && pwd )"
    outputs_dir="$(cd $scripts_dir/outputs && pwd)"
    repo_dir="$(cd $scripts_dir/.. && pwd)"

    # Move the parent (repository) directory
    cd "$repo_dir"

    echo "Building RPM packages..."

    echo "Removing old files."
    rm -rf $outputs_dir/*

    for image in 'kohkimakimoto/rpmbuild:el6' 'kohkimakimoto/rpmbuild:el7'; do
        docker run \
            --env DOCKER_IMAGE=${image}  \
            -v $repo_dir:/tmp/repo \
            -w /tmp/repo \
            --rm \
            ${image} \
            bash ./build_scripts/build.sh
    done

    exit 0
fi

# The following code is executed in the docker container.
echo "Running packaging script in '$DOCKER_IMAGE' container..."

repo_dir=$(pwd)
platform=el${RHEL_VERSION}

cp -pr build_scripts/SPECS $HOME/rpmbuild/
cp -pr build_scripts/SOURCES $HOME/rpmbuild/

echo "Downloading git source."
if [ -f "./cache/git-${git_version}.tar.gz" ]; then
    echo "There is a cache. skip downloading."
else
    cd ./cache \
        && wget -q  https://www.kernel.org/pub/software/scm/git/git-${git_version}.tar.gz  \
        && cd -
fi

cp ./cache/git-${git_version}.tar.gz $HOME/rpmbuild/SOURCES/

echo "Installing dependences..."
sudo yum install -y \
  zlib-devel  \
  openssl-devel  \
  curl-devel \
  expat-devel \
  gettext \
  xmlto \
  asciidoc \
  perl \
  subversion-perl \
  perl-YAML \
  perl-Error \
  perl-ExtUtils-MakeMaker

echo "Building RPM..."
cd $HOME
rpmbuild \
    -ba rpmbuild/SPECS/git.spec

echo "Copying generated files to shared folder..."
cd $repo_dir

mkdir -p build_scripts/outputs/${platform}
cp -pr $HOME/rpmbuild/RPMS  build_scripts/outputs/${platform}
cp -pr $HOME/rpmbuild/SRPMS build_scripts/outputs/${platform}

echo "Done."
