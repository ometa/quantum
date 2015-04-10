# Quantum
*Your homedir, everywhere at once.*

Quantum allows you to sync your home directory across all of your Linux
and OSX platforms.  It uses a github repository to store the data.

Note: If you have anything sensitive in your home directory you should
use a private git repository.

## Installation

1. Fork this repo.

1. Clone the repo to your local machine.

1. Build all symlinks

        setup.sh

1. If you use Janus, run this to install it.

        janus-bootstrap.sh

## Useful Commands

### Update Janus to most recent version

    bin/update-janus

### Source your bashrc after making changes

    source ~/.bashrc

### Re-link all of your quantum data
*This will make backups of any files that are overridden.*

    setup.sh --force
