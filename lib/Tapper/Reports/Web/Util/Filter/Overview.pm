package Tapper::Reports::Web::Util::Filter::Overview;
BEGIN {
  $Tapper::Reports::Web::Util::Filter::Overview::AUTHORITY = 'cpan:TAPPER';
}
{
  $Tapper::Reports::Web::Util::Filter::Overview::VERSION = '4.1.2';
}





use Moose;
use Hash::Merge::Simple 'merge';
use Set::Intersection 'get_intersection';

use Tapper::Model 'model';

extends 'Tapper::Reports::Web::Util::Filter';

sub BUILD{
        my $self = shift;
        my $args = shift;

        $self->dispatch(
                        merge($self->dispatch,
                              {like    => \&like,
                               weeks  => \&weeks,
                               hostname  => \&hostname,
                              })
                       );
}



sub weeks
{
        my ($self, $filter_condition, $duration) = @_;

        my $timeframe = DateTime->now->subtract(weeks => $duration);
        my $dtf = model("ReportsDB")->storage->datetime_parser;
        push @{$filter_condition->{late}}, {'reports.created_at' => {'>=' => $dtf->format_datetime($timeframe) }};
        return $filter_condition;
}



sub like
{
        my ($self, $filter_condition, $regexp) = @_;

        $regexp =~ tr/*/%/;
        $filter_condition->{early}->{name} = { 'like', $regexp} ;

        return $filter_condition;
}


sub hostname
{
        my ($self, $filter_condition, $regexp) = @_;

        $regexp =~ tr/*/%/;
        $filter_condition->{early}->{machine_name} = { 'like', $regexp} ;

        return $filter_condition;
}


1;

__END__
=pod

=encoding utf-8

=head1 NAME

Tapper::Reports::Web::Util::Filter::Overview

=head1 SYNOPSIS

 use Tapper::Overviews::Web::Util::Filter::Overview;
 my $filter              = Tapper::Overviews::Web::Util::Filter::Overview->new();
 my $filter_args         = ['host','bullock','days','3'];
 my $allowed_filter_keys = ['host','days'];
 my $searchoptions       = $filter->parse_filters($filter_args, $allowed_filter_keys);

=head2 weeks

Add weeks filters to early filters. This checks whether the overview
element was used in the last given weeks.

@param hash ref - current version of filters
@param int      - number of weeks

@return hash ref - updated filters

=head2 like

Add like filters to early filters. Note that the expected regular
expression is not a real regexp. Instead * as wildcard is accepted.

@param hash ref - current version of filters
@param string   - like regexp

@return hash ref - updated filters

=head2 hostname

Add like for the hostname filters to early filters. Note that the expected
regular expression is not a real regexp. Instead * as wildcard is
accepted.

@param hash ref - current version of filters
@param string   - like regexp

@return hash ref - updated filters

=head1 NAME

Tapper::Reports::Web::Util::Filter::Overview - Filter utilities for overview listing

=head1 AUTHOR

AMD OSRC Tapper Team <tapper@amd64.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2012 by Advanced Micro Devices, Inc..

This is free software, licensed under:

  The (two-clause) FreeBSD License

=cut

