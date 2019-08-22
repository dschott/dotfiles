#!/usr/bin/env bash

[ -z "$(command -v git)" ] && exit

# alias g='git'

# complete -o default -F __git_complete_command g


# __git_aliased_command               __git_complete_symbol               __git_has_doubledash                __git_reassemble_comp_words_by_ref
# __git_complete                      __git_compute_all_commands          __git_heads                         __git_refs
# __git_complete_command              __git_compute_config_vars           __git_index_files                   __git_refs2
# __git_complete_common               __git_compute_merge_strategies      __git_is_configured_remote          __git_refs_remotes
# __git_complete_fetch_refspecs       __git_config_get_set_variables      __git_list_all_commands             __git_remotes
# __git_complete_file                 __git_count_arguments               __git_list_merge_strategies         __git_sequencer_status
# __git_complete_force_with_lease     __git_dequote                       __git_ls_files_helper               __git_support_parseopt_helper
# __git_complete_index_file           __git_eread                         __git_main                          __git_tags
# __git_complete_refs                 __git_find_on_cmdline               __git_match_ctag                    __git_wrap
# __git_complete_remote_or_refspec    __git_find_repo_path                __git_pretty_aliases                __git_wrap__git_main
# __git_complete_revlist              __git_func_wrap                     __git_ps1                           __git_wrap__gitk_main
# __git_complete_revlist_file         __git_get_config_variables          __git_ps1_colorize_gitstring        
# __git_complete_strategy             __git_get_option_value              __git_ps1_show_upstream             
