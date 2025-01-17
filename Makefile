INCLUDES= \
  src/Fl_Flow/Fl_Exception.h \
  src/Fl_Flow/Fl_Helper.h \
  src/Fl_Flow/Fl_Transform.h \
  src/Fl_Flow/Fl_Instruction.h \
  src/Fl_Flow/Fl_State.h \
  src/Fl_Flow/Fl_Flow.h

CXXFLAGS=-Wall -std=c++98 `fltk-config --cxxflags`
LDFLAGS=`fltk-config --ldflags`
CXX=c++

all:
	mkdir -p include/FL

	echo "#ifndef FL_FL_FLOW_H" > include/FL/Fl_Flow.H
	echo "#define FL_FL_FLOW_H" >> include/FL/Fl_Flow.H
	cat $(INCLUDES) >> include/FL/Fl_Flow.H
	echo "#endif" >> include/FL/Fl_Flow.H

	$(CXX) -osample $(CXXFLAGS) -Iinclude src/sample/*.cpp $(LDFLAGS)
	$(CXX) -otutorial $(CXXFLAGS) -Iinclude src/tutorial/*.cpp $(LDFLAGS)
	$(CXX) -ocenter $(CXXFLAGS) -Iinclude src/center/*.cpp $(LDFLAGS)
	$(CXX) -oadvanced $(CXXFLAGS) -Iinclude src/advanced/*.cpp $(LDFLAGS)

clean:
	rm -f sample
	rm -f tutorial
	rm -f center
	rm -f advanced
	rm -r -f include
