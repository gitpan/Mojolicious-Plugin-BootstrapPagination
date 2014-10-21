# NAME

Mojolicious::Plugin::PageNavigator - Page Navigator plugin for Mojolicious
This module has derived from [Mojolicious::Plugin::PageNavigator](http://search.cpan.org/perldoc?Mojolicious::Plugin::PageNavigator)

# SYNOPSIS

    # Mojolicious::Lite
    plugin 'bootstrap_nagination'

    # Mojolicious
    $self->plugin( 'bootstrap_nagination' );

# DESCRIPTION

[Mojolicious::Plugin::BootstrapPagination](http://search.cpan.org/perldoc?Mojolicious::Plugin::BootstrapPagination) generates standard page navigation bar, like 
  

<<  1  2 ... 11 12 13 14 15 ... 85 86 >>

# HELPERS

## bootstrap\_pagination

    %= bootstrap_nagination( $current_page, $total_pages, $opts );

### Options

Options is a optional ref hash.

    %= bootstrap_nagination( $current_page, $total_pages, {
        round => 4,
        outer => 2,
        class => 'pagination-lg',
        param => 'page' } );

- round

    Number of pages around the current page. Default: 4.

- outer

    Number of outer window pages (first and last pages). Default 2.

- param

    Name of param for query url. Default: 'page'

# SEE ALSO

[Mojolicious](http://search.cpan.org/perldoc?Mojolicious), [Mojolicious::Guides](http://search.cpan.org/perldoc?Mojolicious::Guides), [http://mojolicio.us](http://mojolicio.us),[Mojolicious::Plugin::PageNavigator](http://search.cpan.org/perldoc?Mojolicious::Plugin::PageNavigator).

# Repository

https://github.com/dokechin/Mojolicious-Plugin-BootstrapPagination

# LICENSE

Copyright (C) dokechin.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

dokechin <>
