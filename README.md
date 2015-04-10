# Quantum
*Your homedir, everywhere at once.*

Quantum allows you to sync your home directory across all of your Linux
and OSX platforms.  It uses a github repository to store the data.

Note: If you have anything sensitive in your home directory you should
use a private git repository.

Also, be careful not to overwrite your existing home directory files.
While Quantum does make backups before overwriting, it's adviseable to
make your own backup prior to installing it, just to be safe.

## Installation

1. Fork this repo.

1. Clone the repo to your local machine.

1. Build all symlinks

        setup.sh

1. If you use Janus, run this to install it.

        janus-bootstrap.sh

1. Customize the files in your homedir. Ensure you are editing the
   symlinks in your homedir to ensure that they get stored in the git
   repo.

1. Run `quantum-add` to add any new files to the repo

1. Run `quantum-update to commit any local changes and pull down any
   remote changes.

1. Run `s` to re-source your `.bashrc`


## Useful Commands

### Update Janus to most recent version

    bin/update-janus

### Source your bashrc after making changes

    source ~/.bashrc

### Re-link all of your quantum data

    setup.sh --force
