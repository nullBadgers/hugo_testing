main()
{
    HUGO_VERSION=0.147.7

    export TZ='London/Europe'

    # Install Hugo
    echo "Installing Hugo version ${HUGO_VERSION}..."
    curl -LJO https://github.com/gohugoio/hugo/releases/tag/v0.151.0/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz
    tar -xvzf hugo_extended_${HUGO_VERSION}_Linux-64bit
    cp hugo /opt/buildhome

    # Verify installation
    echo "verifying Hugo installation..."
    echo Go: "$(go version)"
    echo Hugo: "$(hugo version)"
    echo Node.js: "$(node -version)"

    # clone the repo
    echo "Clone blowfish repo..."
    git submodule update --init --recursive
    git config core.quotePath false

    # Build the site
    echo "Building the site..."
    echo hugo --gc --minify

}

set -euo pipefail
main "$@"
