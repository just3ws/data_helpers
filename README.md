# DataHelpers

Ruby command line utility to generate sample data for coding exercises

## Installation

- Clone the repo
- `bundle install`
- Run `bundle exec ./bin/dh`

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Usage

Inside the cloned repo.

Examples:

- Print comma-delimited headers and one comma-delimited fields to `STDOUT`.

```shell
bundle exec ./bin/dh

```

- Print pipe-delimited header and 100 pipe-delimited fields to `STDOUT`.

```shell
bundle exec ./bin/dh --lines 100 --delimiter pipe

# Is equivalent to

bundle exec ./bin/dh -l 100 -d pipe
```

- Print space-delimited fields without headers into file while displaying
  verbose runtime information.

```shell
bundle exec ./bin/dh --delimiter space --lines 10 --no-headers --verbose > example.txt
cat example.txt
```

## Command Line Options

- Header and field data is written to `STDOUT`.
- Logging and error data is written to `STDERR`.

### --help OR -h

Prints usage information.

### --verbose

Writes extra runtime information to `STDERR`.

### --delimiter [DELIMITER] OR -d [DELIMITER]

Name of the delimiter to use for output.

Allowed values:

- `comma`
- `pipe`
- `space`

If no option provided then comma delimiter is default.

- `--delimiter comma` OR `-d comma`

Use ", " as delimiter between cells.

- `--delimiter pipe` OR `-d pipe`

Use " | " as delimiter between cells.

- `--delimiter space` OR `-d space`

Use single whitespace character as delimiter between cells.

### --lines NUMBER or -l NUMBER

The number of lines to generate.

Allowed values:

- non-negative integer >= 0

If no option provided then 1 is default.

### --prepend-headers

Field headers will be printed then fields will print as configured.

### --no-headers

Field headers will _not_ be printed before fields.

### --only-headers

Field headers will be printed followed and _no_ fields will be printed.
