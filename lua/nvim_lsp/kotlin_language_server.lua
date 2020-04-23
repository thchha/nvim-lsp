--- default config for gradle-projects of the
--- kotlin-language-server: https://github.com/fwcd/kotlin-language-server
--- 
--- This server requires vim to be aware of the kotlin-filetype.
--- You could refer for this capability to:
--- 	https://github.com/udalov/kotlin-vim (recommended)
--- 	Note that there is no LICENSE specified yet.

local vim = vim	-- from global table
local util = require 'nvim_lsp/util'
local configs = require 'nvim_lsp/configs'
--- kotlin-language-server supports multiple types of projects.
--- The default works with single- and multi-module gradle projects.
local function get_project_root()
  return util.root_pattern("settings.gradle")
end

configs.kotlin_language_server = {
  default_config = util.utf8_config {
	filetypes = { "kotlin" };
	root_dir = get_project_root();
	log_level = vim.lsp.protocol.MessageType.Warning;
  };
  docs = {
	vscode = "0.5.2";
	description = [[
A kotlin language server which was developed for internal usage and 
released afterwards. Maintaining is not done by the original author, 
but by fwcd. 

It is builded via gradle and developed on github.
Source and additional description: 
	https://github.com/fwcd/kotlin-language-server
]];
	default_config = {
	  root_dir = [[root_pattern("settings.gradle")]];
	  capabilities = [[
	  smart code completion,
	  diagnostics,
	  hover, 
	  document symbols,
	  definition lookup,
	  method signature help,
	  dependency resolution,
	  additional plugins from: https://github.com/fwcd

		Snipped of License (refer to source for full License):

		The MIT License (MIT)

		Copyright (c) 2016 George Fraser
		Copyright (c) 2018 fwcd

	  ]];
	};
  };
}

