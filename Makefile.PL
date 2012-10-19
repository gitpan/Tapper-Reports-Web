
use strict;
use warnings;

use 5.010;

use ExtUtils::MakeMaker 6.30;

use File::ShareDir::Install;
install_share dist => "root";


my %WriteMakefileArgs = (
  "ABSTRACT" => "Tapper - Frontend web application based on Catalyst",
  "AUTHOR" => "AMD OSRC Tapper Team <tapper\@amd64.org>",
  "BUILD_REQUIRES" => {
    "Tapper::Schema::TestTools" => 0,
    "Test::Deep" => 0,
    "Test::Fixture::DBIC::Schema" => 0,
    "Test::More" => 0,
    "Test::WWW::Mechanize::Catalyst" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30",
    "File::ShareDir::Install" => "0.03"
  },
  "DISTNAME" => "Tapper-Reports-Web",
  "EXE_FILES" => [
    "bin/tapper_reports_web_fastcgi_public.pl",
    "bin/tapper_reports_web_fastcgi_live.pl",
    "bin/tapper_reports_web_cgi.pl",
    "bin/tapper_reports_web_fastcgi.pl",
    "bin/tapper_reports_web_create.pl",
    "bin/tapper_reports_web_server.pl",
    "bin/tapper_reports_web_test.pl"
  ],
  "LICENSE" => "open_source",
  "NAME" => "Tapper::Reports::Web",
  "PREREQ_PM" => {
    "Catalyst" => 0,
    "Catalyst::Controller" => 0,
    "Catalyst::Controller::HTML::FormFu" => 0,
    "Catalyst::Model::DBIC::Schema" => 0,
    "Catalyst::Plugin::ConfigLoader" => 0,
    "Catalyst::Plugin::Session" => 0,
    "Catalyst::Plugin::Session::State::Cookie" => 0,
    "Catalyst::Plugin::Session::Store::File" => 0,
    "Catalyst::Plugin::Static::Simple" => 0,
    "Catalyst::Runtime" => 0,
    "Catalyst::ScriptRunner" => 0,
    "Catalyst::View::HTML::Mason" => 0,
    "Cwd" => 0,
    "Data::DPath" => 0,
    "Data::Dumper" => 0,
    "DateTime" => 0,
    "DateTime::Format::DateParse" => 0,
    "DateTime::Format::Natural" => 0,
    "DateTime::Format::Strptime" => 0,
    "DateTime::Format::W3CDTF" => 0,
    "FCGI" => 0,
    "File::Basename" => 0,
    "File::Copy::Recursive" => 0,
    "File::Find::Rule" => 0,
    "File::Path" => 0,
    "File::ShareDir" => 0,
    "File::stat" => 0,
    "FindBin" => 0,
    "Getopt::Long" => 0,
    "HTML::FromANSI" => 0,
    "Hash::Merge" => 0,
    "Hash::Merge::Simple" => 0,
    "Module::Find" => "0.11",
    "Moose" => 0,
    "Moose::Role" => 0,
    "Perl6::Junction" => 0,
    "Pod::Usage" => 0,
    "Set::Intersection" => 0,
    "Tapper::Cmd::Precondition" => 0,
    "Tapper::Cmd::Testplan" => 0,
    "Tapper::Cmd::Testrun" => 0,
    "Tapper::Config" => 0,
    "Tapper::Model" => 0,
    "Tapper::Testplan::Plugins::Taskjuggler" => 0,
    "Tapper::Testplan::Reporter" => 0,
    "Template" => 0,
    "XML::Feed" => 0,
    "YAML" => 0,
    "YAML::Syck" => 0,
    "common::sense" => 0,
    "namespace::autoclean" => 0,
    "parent" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "4.1.0",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);

{
package
MY;
use File::ShareDir::Install qw(postamble);
}


