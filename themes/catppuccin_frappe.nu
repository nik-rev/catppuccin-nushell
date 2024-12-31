let theme = {
  rosewater: "#f2d5cf"
  flamingo: "#eebebe"
  pink: "#f4b8e4"
  mauve: "#ca9ee6"
  red: "#e78284"
  maroon: "#ea999c"
  peach: "#ef9f76"
  yellow: "#e5c890"
  green: "#a6d189"
  teal: "#81c8be"
  sky: "#99d1db"
  sapphire: "#85c1dc"
  blue: "#8caaee"
  lavender: "#babbf1"
  text: "#c6d0f5"
  subtext1: "#b5bfe2"
  subtext0: "#a5adce"
  overlay2: "#949cbb"
  overlay1: "#838ba7"
  overlay0: "#737994"
  surface2: "#626880"
  surface1: "#51576d"
  surface0: "#414559"
  base: "#303446"
  mantle: "#292c3c"
  crust: "#232634"
}

let scheme = {
  recognized_command: $theme.blue
  unrecognized_command: $theme.text
  constant: $theme.peach
  punctuation: $theme.overlay2
  operator: $theme.sky
  string: $theme.green
  virtual_text: $theme.surface2
  variable: { fg: $theme.flamingo attr: i }
  filepath: $theme.yellow
}

$env.config.color_config = {
  separator: { fg: $theme.surface2 attr: b }
  leading_trailing_space_bg: { fg: $theme.lavender attr: u }
  header: { fg: $theme.text attr: b }
  empty: { attr: n }
  bool: $scheme.constant
  int: $scheme.constant
  float: $scheme.constant
  filesize: {||
    if $in < 1kb {
      $theme.teal
    } else if $in < 10kb {
      $theme.green
    } else if $in < 100kb {
      $theme.yellow
    } else if $in < 10mb {
      $theme.peach
    } else if $in < 100mb {
      $theme.maroon
    } else if $in < 1gb {
      $theme.red
    } else {
      $theme.mauve
    }
  }
  duration: {||
    if $in < 1day {
      $theme.teal
    } else if $in < 1wk {
      $theme.green
    } else if $in < 4wk {
      $theme.yellow
    } else if $in < 12wk {
      $theme.peach
    } else if $in < 24wk {
      $theme.maroon
    } else if $in < 52wk {
      $theme.red
    } else {
      $theme.mauve
    }
  }
  date: {|| (date now) - $in |
    if $in < 1day {
      $theme.teal
    } else if $in < 1wk {
      $theme.green
    } else if $in < 4wk {
      $theme.yellow
    } else if $in < 12wk {
      $theme.peach
    } else if $in < 24wk {
      $theme.maroon
    } else if $in < 52wk {
      $theme.red
    } else {
      $theme.mauve
    }
  }
  background: $theme.base
  foreground: $theme.text
  cursor: { bg: $theme.text fg: $theme.base }
  range: $scheme.operator
  string: $scheme.string
  nothing: $scheme.constant
  binary: $scheme.constant
  cell-path: $scheme.punctuation
  row_index: $scheme.virtual_text
  record: $theme.text
  list: $theme.text
  hints: $scheme.virtual_text
  search_result: { fg: $theme.base bg: $theme.blue }
  shape_closure: $theme.teal
  closure: $theme.teal
  shape_directory: { fg: $scheme.filepath attr: b }
  shape_externalarg: $theme.text
  shape_filepath: $scheme.filepath
  shape_flag: { fg: $theme.maroon attr: i }
  shape_globpattern: $scheme.filepath
  shape_int: $scheme.constant
  shape_internalcall: $scheme.recognized_command
  shape_list: $scheme.punctuation
  shape_matching_brackets: { attr: u }
  shape_nothing: $scheme.constant
  shape_pipe: $scheme.operator
  shape_record: $scheme.punctuation
  shape_string: $scheme.string
  shape_string_interpolation: $theme.flamingo
  shape_raw_string: $scheme.string
  shape_garbage: $theme.red
  shape_keyword: $theme.mauve
  shape_block: $theme.blue
  block: $theme.blue
  shape_match_pattern: $theme.green
  shape_operator: $scheme.operator
  shape_table: $scheme.punctuation
  shape_variable: $scheme.variable
  shape_bool: $scheme.constant
  shape_signature: $theme.teal
  shape_vardecl: $scheme.variable
  shape_external: $scheme.unrecognized_command
  shape_range: $scheme.operator
  shape_redirection: $scheme.operator
  shape_float: $scheme.constant
  shape_binary: $scheme.constant
  shape_datetime: $scheme.constant
  shape_external_resolved: $scheme.recognized_command
  shape_custom: $theme.pink
  custom: $theme.pink
  glob: { fg: "#00ff00" bg: "#00ff00" }
  shape_literal: $scheme.constant
  shape_glob_interpolation: { fg: "#ff00ff" bg: "#ff00ff" }
}
$env.config.highlight_resolved_externals = true

$env.config.explore = {
    status_bar_background: { fg: $theme.text, bg: $theme.mantle },
    command_bar_text: { fg: $theme.text },
    highlight: { fg: $theme.base, bg: $theme.yellow },
    status: {
        error: $theme.red,
        warn: $theme.yellow,
        info: $theme.blue,
    },
    selected_cell: { bg: $theme.blue fg: $theme.base },
}
