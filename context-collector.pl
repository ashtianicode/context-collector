#!/usr/bin/env perl
use strict;
use warnings;
use File::Find;
use File::Slurp;
use File::Basename;
use Getopt::Long;

my ($help, $dir, $output, $include, $exclude);

GetOptions(
    'help|h'      => \$help,
    'dir|d=s'     => \$dir,
    'output|o=s'  => \$output,
    'include|i=s' => \$include,
    'exclude|e=s' => \$exclude,
) or usage();

usage() if $help;

# Default values if none provided
$dir    ||= '.';
$output ||= 'codebase.md';

# Prepare patterns
my @includes  = $include ? split(/,/, $include) : ();
my @excludes  = $exclude ? split(/,/, $exclude) : ();
my $in_regex  = @includes ? join('|', map { quotemeta($_) } @includes) : '';
my $ex_regex  = @excludes ? join('|', map { quotemeta($_) } @excludes) : '';

my @files;
find(
    sub {
        return unless -f $_;  # only files
        my $path = $File::Find::name;

        # If we have includes, skip unless matched
        return if $in_regex && ($path !~ /$in_regex/i);
        # If we have excludes, skip if matched
        return if $ex_regex && ($path =~ /$ex_regex/i);

        push @files, $path;
    },
    $dir
);

@files = sort @files;

open my $fh, '>', $output
  or die "Cannot open '$output' for writing: $!\n";

foreach my $file (@files) {
    print $fh "---------------------------------------------\n";
    print $fh "-------------- ", basename($file), " -------------\n";
    print $fh "---------------------------------------------\n\n";

    print $fh scalar read_file($file), "\n\n";
}

close $fh;

print "Wrote documentation to '$output'\n";
print "Processed ", scalar(@files), " files.\n";

sub usage {
    print <<"END_USAGE";
Usage: $0 [options]

  -d, --dir <directory>      Directory to scan (default: current directory)
  -o, --output <file>        Output file (default: codebase.md)
  -i, --include <patterns>   Comma-separated list of patterns to include
  -e, --exclude <patterns>   Comma-separated list of patterns to exclude
  -h, --help                 Display this help message

Examples:
  $0 --dir=myproject --output=docs.md
  $0 --include=go,txt --exclude=pkg,.git

END_USAGE
    exit;
} 