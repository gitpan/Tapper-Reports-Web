package Tapper::Reports::Web::Role::BehaviourModifications::Path;
BEGIN {
  $Tapper::Reports::Web::Role::BehaviourModifications::Path::AUTHORITY = 'cpan:AMD';
}
{
  $Tapper::Reports::Web::Role::BehaviourModifications::Path::VERSION = '4.1.0';
}
use Moose::Role;

# I am sick of getting relocated/rebase on our local path!
# Cut away a trailing 'tapper/' from base and prepend it to path.
# All conditionally only when this annoying environment is there.
after 'prepare_path' => sub {
                             my ($c) = @_;

                             my $base        =  $c->req->{base}."";
                             $base           =~ s,tapper/$,, if $base;
                             $c->req->{base} =  bless( do{\(my $o = $base)}, 'URI::http' );
                             $c->req->path('tapper/'.$c->req->path) unless ( $c->req->path =~ m,^tapper/?,);
                            };

1;

__END__
=pod

=encoding utf-8

=head1 NAME

Tapper::Reports::Web::Role::BehaviourModifications::Path

=head1 AUTHOR

AMD OSRC Tapper Team <tapper@amd64.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2012 by Advanced Micro Devices, Inc..

This is free software, licensed under:

  The (two-clause) FreeBSD License

=cut

