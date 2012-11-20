package Tapper::Reports::Web::View::Mason;
BEGIN {
  $Tapper::Reports::Web::View::Mason::AUTHORITY = 'cpan:TAPPER';
}
{
  $Tapper::Reports::Web::View::Mason::VERSION = '4.1.2';
}

use Moose;
use namespace::autoclean;
extends 'Catalyst::View::HTML::Mason';

use File::ShareDir ':ALL';
use Cwd;

my $root_dir = [
                [ tapperroot1 => getcwd."/root" ],
                [ tapperroot2 => eval { dist_dir("Tapper-Reports-Web") } || getcwd."/root" ],
               ];

__PACKAGE__->config({ template_extension => '.mas',
                      globals            => [['$c' => sub { $_[1] } ]],
                      interp_args        => { comp_root            => $root_dir,
                                              default_escape_flags => [ 'h' ],
                                              escape_flags         => {
                                                                       url => \&my_url_filter,
                                                                       h   => \&HTML::Mason::Escapes::basic_html_escape,
                                                                      },
                                            },
                    });

sub my_url_filter
{
        my $text_ref = shift;
        my $kopie     = $$text_ref;
        Encode::_utf8_off($kopie); # weil URI::URL mit utf8-Flag das falsche macht
        $$text_ref = URI::URL->new($kopie)->as_string;
        $$text_ref =~ s,/,%2F,g;
}


1;

# Local Variables:
# buffer-file-coding-system: utf-8
# End:

__END__
=pod

=encoding utf-8

=head1 NAME

Tapper::Reports::Web::View::Mason

=head1 SYNOPSIS

    Very simple to use

=head1 DESCRIPTION

Very nice component.

=head1 NAME

Tapper::Reports::Web::View::Mason - Mason View Component

=head1 AUTHOR

Clever guy

=head1 LICENSE

This library is free software . You can redistribute it and/or modify it under
the same terms as perl itself.

=head1 AUTHOR

AMD OSRC Tapper Team <tapper@amd64.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2012 by Advanced Micro Devices, Inc..

This is free software, licensed under:

  The (two-clause) FreeBSD License

=cut

