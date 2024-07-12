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

blueprints = custom_target('blueprints',
  input: files(
    # LIST YOUR BLUEPRINT FILES HERE
    'ui/dialog.blp'
  ),
  output: '.',
  command: [find_program('blueprint-compiler'), 'batch-compile', '@OUTPUT@', '@CURRENT_SOURCE_DIR@', '@INPUT@'],
)

kagent_sources += gnome.compile_resources('kagent-resources',
  'kagent.gresource.xml',
  dependencies: blueprints,
  c_name: 'kagent'
)

add_project_arguments([
  '-g'
], language: 'vala')

executable('kagent', kagent_sources,
  dependencies: kagent_deps,
       install: true,
        c_args: [
          '-DPOLKIT_AGENT_I_KNOW_API_IS_SUBJECT_TO_CHANGE',
        ],
)
