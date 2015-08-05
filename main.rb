require 'gtk3'
require 'ffi'

module Wnck3

	extend FFI::Library
	ffi_lib "libwnck-3.so.0"
	
# Shortcuts for C types used by the API
	ptr = :pointer;		ul = :ulong;	str = :string;		bool = :bool;	int = :int;			
	uint = :uint;		void = :void;	u32 = :uint32;		 u = :uint;		gwidget = ptr;
	enum = :enum;

# Attach
	attach_function :wnck_tasklist_new,			[],			ptr
#	attach_function :wnck_tasklist_set_width,	[ptr, int],	void
	attach_function :wnck_tasklist_set_grouping,[ptr, int], void

	extend FFI::Library
	ffi_lib "libgtk-3.so.0"

# Attach
	attach_function :gtk_main,					[],			void
	attach_function :gtk_window_new,			[int],		ptr
	attach_function :gtk_widget_show_all,		[ptr],		void
	attach_function :gtk_container_add,			[ptr, ptr],	void
end

a = Wnck3::wnck_tasklist_new()
#Wnck3::wnck_tasklist_set_width(a,64)
Wnck3::wnck_tasklist_set_grouping(a,1)
win = Wnck3::gtk_window_new(0)
Wnck3::gtk_container_add(win,a)

Wnck3::gtk_widget_show_all(win)
Wnck3::gtk_main()
