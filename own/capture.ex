defmodule CaptureTest do
    def test(a,b,c) do
        a+b+c
    end
end


###########################################################
# c = 10
# Enum.reduce [1,2,3], 0, &CaptureTest.test(&1,&2, c)
#
# each & considered as parameter. 
# means fn(a,b) -> CaptureTest.test(a,b,c)
#
##########################################################