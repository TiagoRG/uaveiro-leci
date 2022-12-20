# New decorator: @traced
#
# PLEASE NOTE:
# This is not a required subject!
# You don't need to understand how this works.
# Just use the module as a service to trace the execution of functions.
#
# Decorator @traced modifies the function so that an execution trace is shown.
# jmr@ua.pt 2016-10-14 (v2)
# 2017-12-03: Name changed from trace -> traced

def traced(func):
    def tracedfunc(*args, **kwargs):
        if traced.indent != None:
            indent = traced.indent  # save current indentation
            traced.indent += u"\u2502   "
            print(u"{}{}{!r}{!r}".format(indent, func.__name__, args, kwargs))
        try:
            r = func(*args, **kwargs)   # CALL the func!
            return r
        except Exception as e:
            r = e
            raise e
        finally:
            if traced.indent != None:
                print(u"{}\u2514>{!r}".format(indent, r))
                traced.indent = indent  # restore indentation
    
    return tracedfunc

# Initial tracing prefix:
traced.indent = ""

# Uncomment to turn off tracing by default:
#traced.indent = None

#traced.indent = traced.__dict__.get("indent")


if __name__ == "__main__":

    # How to use this module:
    from traced import traced
    
    @traced
    def func(x):
        return x*x

    func(3)

