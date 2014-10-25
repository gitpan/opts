use strict;
use warnings;
use opts;
use Test::More;
use Test::Exception;

{
    package Foo;
    use Mouse;
    use opts;
    sub class_method {
        opts my $class,
            my $ppp => 'Str';
        return "CLASS_METHOD: $class, $ppp";
    }
    sub instance_method {
        opts my $self,
            my $ppp => 'Str';
        return sprintf("INSTANCE_METHOD: %s, $ppp", ref($self));
    }
}

@ARGV = qw(--ppp=YAY);
is( Foo->class_method(), "CLASS_METHOD: Foo, YAY");
@ARGV = qw(--ppp=PEY);
is(Foo->new->instance_method(), "INSTANCE_METHOD: Foo, PEY");
done_testing;
