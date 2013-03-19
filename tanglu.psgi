use strict;
use warnings;

use Tanglu;

my $app = Tanglu->apply_default_middlewares(Tanglu->psgi_app);
$app;

