/**
   C tests that must run
 */
module it.run.c;

import it;

@("function named debug")
@safe unittest {
    shouldCompileAndRun(
        C(
            q{
                void debug(const char* msg);
            }
        ),
        C(
            q{
                #include <stdio.h>
                void debug(const char* msg) { printf("%s\n", msg); }
            }
        ),
        D(
            q{
                debug_("Hello world!\n");
            }
         ),
    );
}


@("struct var collision")
@safe unittest {
    shouldCompileAndRun(
        C(
            q{
                struct foo { int dummy; };
                extern int foo;
            }
        ),
        C(
            q{
                int foo;
            }
        ),
        D(
            q{
                auto s = struct_foo(33);
                foo = 42;
            }
        ),
    );
}
