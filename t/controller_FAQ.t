use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Tanglu';
use Tanglu::Controller::FAQ;

ok( request('/faq')->is_success, 'Request should succeed' );
done_testing();
