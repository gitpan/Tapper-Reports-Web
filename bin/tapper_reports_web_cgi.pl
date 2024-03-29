#!/usr/bin/env perl
# PODNAME: tapper_reports_web_cgi.pl
# ABSTRACT: Tapper - web gui start script - cgi

use Catalyst::ScriptRunner;
Catalyst::ScriptRunner->run('Tapper::Reports::Web', 'CGI');

1;



__END__
=pod

=encoding utf-8

=head1 NAME

tapper_reports_web_cgi.pl - Tapper - web gui start script - cgi

=head1 SYNOPSIS

See L<Catalyst::Manual>

=head1 DESCRIPTION

Run a Catalyst application as a cgi script.

=head1 NAME

tapper_reports_web_cgi.pl - Catalyst CGI

=head1 AUTHORS

Catalyst Contributors, see Catalyst.pm

=head1 COPYRIGHT

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

AMD OSRC Tapper Team <tapper@amd64.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2012 by Advanced Micro Devices, Inc..

This is free software, licensed under:

  The (two-clause) FreeBSD License

=cut

