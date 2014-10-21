#!/usr/bin/env perl


use strict;
use warnings;


BEGIN{
  $ENV{MOJO_NO_IPV6} = $ENV{MOJO_POLL} = 1 ;
  $ENV{MOJO_APP} = undef; # 
}
use Test::More tests => 18;
use Test::Mojo;


use Mojolicious::Lite;
plugin 'bootstrap_pagination';
get( "/" => sub(){
    my $self = shift;
    $self->render( text => $self->bootstrap_pagination( 10, 15 ) . "\n" );
  } );

get( "/none" => sub(){
    my $self = shift;
    $self->render( text => $self->bootstrap_pagination( 1, 1) . "\n" );
  } );

get( "/class" => sub(){
    my $self = shift;
    $self->render( text => $self->bootstrap_pagination( 1, 2, {class=>"test"}) . "\n" );
  } );

get( "/param" => sub(){
    my $self = shift;
    $self->render( text => $self->bootstrap_pagination( 1, 2, {param=>"p"}) . "\n" );
  } );

get( "/round" => sub(){
    my $self = shift;
    $self->render( text => $self->bootstrap_pagination( 10, 15, {round=>1}) . "\n" );
  } );

get( "/outer" => sub(){
    my $self = shift;
    $self->render( text => $self->bootstrap_pagination( 10, 15, {round=>1,outer=>1}) . "\n" );
  } );

my $t = Test::Mojo->new(  );
$t->get_ok( "/" )
  ->status_is( 200 )
  ->content_is(<<EOF);
<ul class="pagination"><li><a href="/?page=9" >&laquo;</a></li><li><a href="/?page=1">1</a></li><li><a href="/?page=2">2</a></li><li><a href="#" >..</a></li><li><a href="/?page=6">6</a></li><li><a href="/?page=7">7</a></li><li><a href="/?page=8">8</a></li><li><a href="/?page=9">9</a></li><li class="disabled"><a href="#">10</a></li><li><a href="/?page=11">11</a></li><li><a href="/?page=12">12</a></li><li><a href="/?page=13">13</a></li><li><a href="/?page=14">14</a></li><li><a href="/?page=15">15</a></li><li><a href="/?page=11" >&raquo;</a></li></ul>
EOF

$t->get_ok( "/none" )
  ->status_is( 200 )
  ->content_is(<<EOF);

EOF

$t->get_ok( "/class" )
  ->status_is( 200 )
  ->content_is(<<EOF);
<ul class="pagination test"><li class="disabled"><a href="#" >&laquo;</a></li><li class="disabled"><a href="#">1</a></li><li><a href="/class?page=2">2</a></li><li><a href="/class?page=2" >&raquo;</a></li></ul>
EOF

$t->get_ok( "/param" )
  ->status_is( 200 )
  ->content_is(<<EOF);
<ul class="pagination"><li class="disabled"><a href="#" >&laquo;</a></li><li class="disabled"><a href="#">1</a></li><li><a href="/param?p=2">2</a></li><li><a href="/param?p=2" >&raquo;</a></li></ul>
EOF

$t->get_ok( "/round" )
  ->status_is( 200 )
  ->content_is(<<EOF);
<ul class="pagination"><li><a href="/round?page=9" >&laquo;</a></li><li><a href="/round?page=1">1</a></li><li><a href="/round?page=2">2</a></li><li><a href="#" >..</a></li><li><a href="/round?page=9">9</a></li><li class="disabled"><a href="#">10</a></li><li><a href="/round?page=11">11</a></li><li><a href="#" >..</a></li><li><a href="/round?page=14">14</a></li><li><a href="/round?page=15">15</a></li><li><a href="/round?page=11" >&raquo;</a></li></ul>
EOF

$t->get_ok( "/outer" )
  ->status_is( 200 )
  ->content_is(<<EOF);
<ul class="pagination"><li><a href="/outer?page=9" >&laquo;</a></li><li><a href="/outer?page=1">1</a></li><li><a href="#" >..</a></li><li><a href="/outer?page=9">9</a></li><li class="disabled"><a href="#">10</a></li><li><a href="/outer?page=11">11</a></li><li><a href="#" >..</a></li><li><a href="/outer?page=15">15</a></li><li><a href="/outer?page=11" >&raquo;</a></li></ul>
EOF
