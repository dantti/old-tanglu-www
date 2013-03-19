package Tanglu::View::HTML;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
    ENCODING => "UTF-8",
    TEMPLATE_EXTENSION => '.tt2',
    # Set the location for TT files
    INCLUDE_PATH => [
            Tanglu->path_to( 'root', 'src' ),
        ],
    # Set to 1 for detailed timer stats in your HTML as comments
    TIMER              => 0,
    # This is your wrapper template located in the 'root/src'
    WRAPPER => 'wrapper.tt2',
    render_die => 1,
);

use Template::Filters;
$Template::Filters::FILTERS->{escape_js_string} = \&escape_js_string;
sub escape_js_string {
  my $s = shift;
  $s =~ s/(\\|'|"|\/)/\\$1/g;
  return $s;
}

=head1 NAME

Tanglu::View::HTML - TT View for Tanglu

=head1 DESCRIPTION

TT View for Tanglu.

=head1 SEE ALSO

L<Tanglu>

=head1 AUTHOR

Daniel Nicoletti,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
