file(REMOVE_RECURSE
  "App.qml"
  "BaseCintroller.qml"
  "BaseControllerForm.ui.qml"
  "Screen01.ui.qml"
  "fonts/fonts.txt"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/content_tooling.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
