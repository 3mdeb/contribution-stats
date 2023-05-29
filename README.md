# Contribution stats

The goal of this script is to extract the commits stats made by 3mdeb employees
in various upstream repositories.

This project uses [bashly](https://bashly.dannyb.co/usage/getting-started/) as
a script generator.

## Usage

* Sync

```
contribution-stats sync - Clone and/or all tracked upstream repositories

Alias: s

Usage:
  contribution-stats sync
  contribution-stats sync --help | -h

Options:
  --help, -h
    Show this help

Examples:
  contribution-stats sync

```

__NOTE__: To sync all repositories that 3mdeb contributed to you need at least
31GB free space.

* List

```
contribution-stats list - List contribution stats

Alias: l

Usage:
  contribution-stats list [OPTIONS]
  contribution-stats list --help | -h

Options:
  --repo, -r REPOSITORY
    Repository to analyze. If not given, all tracked repositories will be
    analyzed.

  --date, -d DATE
    Start date for analyze - only commits older than this date will be listed.
    Defaults to 01/01/2013.
    Default: 01/01/2013

  --help, -h
    Show this help

Examples:
  contribution-stats list
  contribution-stats -r coreboot -d 21/02/2023
```
