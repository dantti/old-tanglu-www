use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Tanglu';
use Tanglu::Controller::Contribute;

ok( request('/contribute')->is_success, 'Request should succeed' );
done_testing();
