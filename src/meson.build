kagent_sources = [
  'App.vala',
  'Agent.vala',
  'Dialog.vala'
]

kagent_deps = [
  dependency('gtk4'),
  dependency('glib-2.0'),
  dependency('libadwaita-1', version: '>= 1.4'),
  dependency('polkit-agent-1'),
  dependency('polkit-gobject-1'),
  meson.get_compiler('vala').find_library('posix')
]

kagent_sources += gnome.compile_resources('kagent-resources',
  'kagent.gresource.xml',
  c_name: 'kagent'
)

executable('kagent', kagent_sources,
  dependencies: kagent_deps,
       install: true,
        c_args: [
          '-DPOLKIT_AGENT_I_KNOW_API_IS_SUBJECT_TO_CHANGE',
        ],
)
