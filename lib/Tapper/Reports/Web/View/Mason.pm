package Tapper::Reports::Web::View::Mason;
BEGIN {
  $Tapper::Reports::Web::View::Mason::AUTHORITY = 'cpan:AMD';
}
{
  $Tapper::Reports::Web::View::Mason::VERSION = '4.0.2';
}

use strict;
use warnings;

use Tapper::Reports::Web;

use base 'Catalyst::View::Mason';

__PACKAGE__->config( use_match          => 0      );
__PACKAGE__->config( template_extension => '.mas' );
__PACKAGE__->config( use_match          => 0      );
__PACKAGE__->config( dynamic_comp_root  => 1      );
__PACKAGE__->config( comp_root          => [
                                            [ tapperroot => Tapper::Reports::Web->config->{root}.'' ],
                                           ]
                   );
__PACKAGE__->config( default_escape_flags => [ 'h' ]);
__PACKAGE__->config( escape_flags => {
                                      url => \&my_url_filter,
                                      h   => \&HTML::Mason::Escapes::basic_html_escape,
                                     }
                   );

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

