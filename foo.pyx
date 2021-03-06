cimport foo

cdef extern from "foo_api.h":
	struct foo_obj:
		int a
		int b

	int show_int(int a)
	int show_obj(foo_obj *b)
	void load_obj(foo_obj *b)

class FooObj(object):
	def __init__(self):
		self.a = 0
		self.b = 0

class Foo(object):
	def show_int(self, a):
		foo.show_int(a)

	def show_obj(self, a):
		cdef foo_obj obj
		obj.a = a.a
		obj.b = a.b
		foo.show_obj(&obj)
	
	def load_obj(self, a):
		cdef foo_obj obj
		foo.load_obj(&obj)
		a.a = obj.a
		a.b = obj.b
	
