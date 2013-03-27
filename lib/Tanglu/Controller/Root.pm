package Tanglu::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=head1 NAME

Tanglu::Controller::Root - Root Controller for Tanglu

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 auto

The auto method page (/)

Note that 'auto' runs after 'begin' but before your actions and that
'auto's "chain" (all from application path to most specific class are run)
See the 'Actions' section of 'Catalyst::Manual::Intro' for more info.

=cut

sub auto : Private {
    my ($self, $c) = @_;

    $c->stash(tanglu => 1);

    if ($c->debug) {
        my $languages = $c->languages;
        $c->log->debug( "Languages setting: " . Data::Dump::dump($languages) );
    }

    return 1;
}

=head2 index

The root page (/)

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

}

=head2 begin (builtin)

Set the language the user has choosen

=cut

sub begin : Private {
    my ( $self, $c ) = @_;
    if($c->sessionid && $c->session->{lang}) {
        $c->languages([$c->session->{lang}]);
    }
}


=head2 set_lang

(Re)set language of current session.

=cut

sub set_lang :Global {
    my ($self,$c) = @_;

    $c->session->{lang} = $c->req->params->{lang};
    $c->res->redirect($c->req->params->{redir});
}


=head2 default

Standard 404 error page

=cut

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->status(404);
    $c->stash(template => '404.tt2');
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

Daniel Nicoletti,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
