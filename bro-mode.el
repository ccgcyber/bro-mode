;; This was done for personal edification and steals from Scott Andrew Borton's
;; Mode Tutorial with aplomb and apologies.

(defvar bro-mode-hook nil)

(defvar bro-mode-map
  (let ((map (make-keymap)))
    (define-key map "\C-j" 'newline-and-indent)
    map)
  "Keymap for Bro major mode")

(add-to-list 'auto-mode-alist '("\\.bro\\'" . bro-mode))

;; keywords
(defconst bro-font-lock-keywords-1
  (list
   '("\\<\\(a\\(?:dd\\|larm\\)\\|break\\|c\\(?:ase\\|on\\(?:st\\|tinue\\)\\)\\|d\\(?:elete\\|o\\)\\|e\\(?:lse\\|num\\|\\(?:ven\\|xpor\\)t\\)\\|f\\(?:or\\|unction\\)\\|global\\|if\\|local\\|module\\|next\\|of\\|print\\|re\\(?:def\\|turn\\)\\|schedule\\|type\\|wh\\(?:en\\|ile\\)\\)\\>" . font-lock-keyword-face)
   '("\\('\\w*'\\)" . font-lock-variable-name-face))
  "Highlighting for basic keywords")

(defconst bro-font-lock-keywords-2
  (append bro-font-lock-keywords-1
          (list
           '("\\<\\(a\\(?:ddr\\|ny\\)\\|bool\\|count\\(?:er\\)?\\|double\\|file\\|int\\(?:erval\\)?\\|net\\|p\\(?:attern\\|ort\\)\\|record\\|s\\(?:et\\|tring\\|ubnet\\)\\|t\\(?:able\\|imer?\\)\\|vector\\)\\>" . font-lock-builtin-face)
           '("\\<\\(OS_version_found\\|a\\(?:c\\(?:k_above_hole\\|tivating_encryption\\)\\|nonymization_mapping\\|rp_re\\(?:ply\\|quest\\)\\|uthentication_\\(?:\\(?:accept\\|reject\\|skipp\\)ed\\)\\)\\|b\\(?:a\\(?:ckdoor_\\(?:remove_conn\\|stats\\)\\|d_\\(?:arp\\|option\\(?:_termination\\)?\\)\\)\\|ittorrent_peer_\\(?:bitfield\\|c\\(?:ancel\\|hoke\\)\\|ha\\(?:\\(?:ndshak\\|v\\)e\\)\\|interested\\|keep_alive\\|not_interested\\|p\\(?:iece\\|ort\\)\\|request\\|un\\(?:choke\\|known\\)\\|weird\\)\\|ro_\\(?:done\\|init\\|script_loaded\\)\\|t_tracker_\\(?:re\\(?:quest\\|sponse\\(?:_not_ok\\)?\\)\\|weird\\)\\)\\|con\\(?:n\\(?:_\\(?:stats\\|weird\\)\\|ection_\\(?:EOF\\|SYN_packet\\|attempt\\|e\\(?:stablished\\|xternal\\)\\|fi\\(?:nished\\|rst_ACK\\)\\|half_finished\\|p\\(?:artial_close\\|ending\\)\\|re\\(?:jected\\|set\\|used\\)\\|stat\\(?:\\(?:e_remov\\|us_updat\\)e\\)\\|timeout\\)\\)\\|tent_gap\\)\\|d\\(?:ce_rpc_\\(?:bind\\|message\\|re\\(?:quest\\|sponse\\)\\)\\|hcp_\\(?:ack\\|d\\(?:ecline\\|iscover\\)\\|inform\\|nak\\|offer\\|re\\(?:lease\\|quest\\)\\)\\|ns_\\(?:A\\(?:\\(?:6\\|AAA\\)?_reply\\)\\|CNAME_reply\\|EDNS_addl\\|HINFO_reply\\|MX_reply\\|NS_reply\\|PTR_reply\\|S\\(?:\\(?:OA\\|RV\\)_reply\\)\\|T\\(?:SIG_addl\\|XT_reply\\)\\|WKS_reply\\|end\\|full_request\\|m\\(?:apping_\\(?:altered\\|lost_name\\|new_name\\|\\(?:unverifie\\|vali\\)d\\)\\|essage\\)\\|query_reply\\|re\\(?:jected\\|quest\\)\\)\\)\\|e\\(?:pm_map_response\\|sp_packet\\|xpected_connection_seen\\)\\|f\\(?:i\\(?:le_\\(?:\\(?:open\\|transferr\\)ed\\)\\|n\\(?:ger_re\\(?:ply\\|quest\\)\\|ished_send_state\\)\\)\\|low_weird\\|tp_\\(?:re\\(?:ply\\|quest\\)\\|signature_found\\)\\)\\|g\\(?:a\\(?:obot_signature_found\\|p_report\\)\\|nutella_\\(?:binary_msg\\|establish\\|http_notify\\|not_establish\\|partial_binary_msg\\|signature_found\\|text_msg\\)\\)\\|http_\\(?:all_headers\\|begin_entity\\|content_type\\|e\\(?:n\\(?:d_entity\\|tity_data\\)\\|vent\\)\\|header\\|message_done\\|proxy_signature_found\\|re\\(?:ply\\|quest\\)\\|s\\(?:ignature_found\\|tats\\)\\)\\|i\\(?:cmp_\\(?:echo_re\\(?:ply\\|quest\\)\\|redirect\\|sent\\|time_exceeded\\|unreachable\\)\\|dent_\\(?:error\\|re\\(?:ply\\|quest\\)\\)\\|n\\(?:consistent_option\\|terconn_\\(?:remove_conn\\|stats\\)\\)\\|pv6_ext_headers\\|rc_\\(?:channel_\\(?:info\\|topic\\)\\|dcc_message\\|error_message\\|global_users\\|inv\\(?:alid_nick\\|ite_message\\)\\|join_message\\|kick_message\\|m\\(?:\\(?:ode_m\\)?essage\\)\\|n\\(?:ames_info\\|etwork_info\\|\\(?:ick\\|otice\\)_message\\)\\|oper_\\(?:\\(?:messag\\|respons\\)e\\)\\|p\\(?:\\(?:a\\(?:rt\\|ssword\\)\\|rivmsg\\)_message\\)\\|quit_message\\|re\\(?:ply\\|quest\\)\\|s\\(?:erver_info\\|ignature_found\\|qu\\(?:\\(?:ery\\|it\\)_message\\)\\)\\|\\(?:user_messag\\|who\\(?:_\\(?:lin\\|messag\\)\\|is_\\(?:channel_lin\\|messag\\|\\(?:operato\\|use\\)r_lin\\)\\)\\)e\\)\\)\\|kazaa_signature_found\\|lo\\(?:ad_sample\\|gin_\\(?:confused\\(?:_text\\)?\\|display\\|failure\\|input_line\\|output_line\\|prompt\\|success\\|terminal\\)\\)\\|m\\(?:ime_\\(?:all_\\(?:data\\|headers\\)\\|begin_entity\\|content_hash\\|e\\(?:n\\(?:d_entity\\|tity_data\\)\\|vent\\)\\|one_header\\|segment_data\\)\\|obile_ipv6_message\\)\\|n\\(?:apster_signature_found\\|cp_re\\(?:ply\\|quest\\)\\|e\\(?:t\\(?:_weird\\|bios_session_\\(?:accepted\\|keepalive\\|message\\|r\\(?:aw_message\\|e\\(?:jected\\|quest\\|t_arg_resp\\)\\)\\)\\|flow_v5_\\(?:header\\|record\\)\\)\\|w_\\(?:connection\\(?:_contents\\)?\\|packet\\)\\)\\|fs_\\(?:proc_\\(?:create\\|getattr\\|lookup\\|mkdir\\|n\\(?:ot_implemented\\|ull\\)\\|r\\(?:e\\(?:ad\\(?:dir\\|link\\)?\\|move\\)\\|mdir\\)\\|write\\)\\|reply_status\\)\\|on_dns_request\\|tp_message\\)\\|p\\(?:a\\(?:cket_contents\\|rtial_connection\\)\\|m_\\(?:attempt_\\(?:callit\\|dump\\|getport\\|null\\|\\(?:un\\)?set\\)\\|bad_port\\|request_\\(?:callit\\|dump\\|getport\\|null\\|\\(?:un\\)?set\\)\\)\\|op3_\\(?:data\\|login_\\(?:failure\\|success\\)\\|re\\(?:ply\\|quest\\)\\|terminate\\|unexpected\\)\\|r\\(?:int_hook\\|o\\(?:filing_update\\|tocol_\\(?:\\(?:confirm\\|viol\\)ation\\)\\)\\)\\)\\|r\\(?:e\\(?:mote_\\(?:c\\(?:apture_filter\\|onnection_\\(?:closed\\|e\\(?:rror\\|stablished\\)\\|handshake_done\\)\\)\\|event_registered\\|log\\(?:_peer\\)?\\|pong\\|state_\\(?:access_performed\\|inconsistency\\)\\)\\|porter_\\(?:error\\|info\\|warning\\)\\|xmit_inconsistency\\)\\|login_signature_found\\|o\\(?:ot_backdoor_signature_found\\|tate_\\(?:interval\\|size\\)\\)\\|pc_\\(?:call\\|dialogue\\|reply\\)\\|sh_re\\(?:ply\\|quest\\)\\)\\|s\\(?:ignature_match\\|m\\(?:b_\\(?:com_\\(?:close\\|generic_andx\\|logoff_andx\\|n\\(?:egotiate\\(?:_response\\)?\\|t_create_andx\\)\\|read_andx\\|setup_andx\\|tr\\(?:ans\\(?:_\\(?:mailslot\\|pipe\\|rap\\)\\|action2?\\)\\|ee_\\(?:connect_andx\\|disconnect\\)\\)\\|write_andx\\)\\|error\\|get_dfs_referral\\|message\\)\\|tp_\\(?:data\\|re\\(?:ply\\|quest\\)\\|\\(?:signature_foun\\|unexpecte\\)d\\)\\)\\|oftware_\\(?:parse_error\\|\\(?:unparsed_\\)?version_found\\)\\|s\\(?:h_\\(?:client_version\\|s\\(?:erver_version\\|ignature_found\\)\\)\\|l_\\(?:alert\\|client_hello\\|e\\(?:stablished\\|xtension\\)\\|se\\(?:rver_hello\\|ssion_ticket_handshake\\)\\)\\)\\|tp_\\(?:c\\(?:orrelate_pair\\|reate_endp\\)\\|re\\(?:move_\\(?:endp\\|pair\\)\\|sume_endp\\)\\)\\|yslog_message\\)\\|t\\(?:cp_\\(?:contents\\|option\\|\\(?:packe\\|rexmi\\)t\\)\\|elnet_signature_found\\)\\|udp_\\(?:contents\\|re\\(?:ply\\|quest\\)\\|session_done\\)\\|x509_\\(?:certificate\\|e\\(?:rror\\|xtension\\)\\)\\)\\>" . font-lock-builtin-face)))
           "Highlighting for operators and event builtins.")

(defvar bro-font-lock-keywords bro-font-lock-keywords-2
  "Default highlighting expressions for Bro mode")

;; indenting
(defun bro-indent-line ()
  "Indent current line as Bro code"
  (interactive)
  (beginning-of-line)
  (if (bobp)
      (indent-line-to 0)
    (let ((not-indented t)
          cur-indent)
      (save-excursion
        (while not-indented
          (if (looking-at "^.*};$")
              (progn
                (setq cur-indent (- (current-indentation) default-tab-width))
                (setq not-indented nil))
            (forward-line -1)
            (if (looking-at "^[ \t]*}")
                (progn
                  (setq cur-indent (- (current-indentation) default-tab-width))
                  (setq not-indented nil))
              (if (looking-at "^[ \t]*\\(event\\|if\\|for\\|export\\|while\\|redef\\)")
                  (progn
                    (setq cur-indent (+ (current-indentation) default-tab-width))
                    (setq not-indented nil))
                (if (looking-at ".*;$")
                    (progn
                      (forward-line -1)
                      (if (looking-at ".*,$")
                          (progn
                            (setq cur-indent (- (current-indentation) default-tab-width))
                            (setq not-indented nil))))
                  (if (bobp)
                      (setq not-indented nil))))))))
      (if (< cur-indent 0)
          (setq cur-indent 0))
      (if cur-indent
          (indent-line-to cur-indent)
        (indent-line-to 0)))))

(defvar bro-mode-syntax-table
  (let ((st (make-syntax-table)))
    (modify-syntax-entry ?_ "w" st)
    (modify-syntax-entry ?# "<" st)
    (modify-syntax-entry ?\n ">" st)
    st)
  "Syntax table for bro-mode")

(defun bro-mode ()
  "Major mode for eding Bro scripting files"
  (interactive)
  (kill-all-local-variables)
  (set-syntax-table bro-mode-syntax-table)
  (use-local-map bro-mode-map)
  (set (make-local-variable 'font-lock-defaults) '(bro-font-lock-keywords))
  (set (make-local-variable 'indent-line-function) 'bro-indent-line)
  (setq major-mode 'bro-mode)
  (setq mode-name "Bro")
  (run-hooks 'bro-mode-hook))

(setq bro-event-bif "~/Documents/src/bro/build/src/base/event.bif.bro")

(defun bro-event-lookup ()
  "Retrieves the documentation for the event at point.

Requires that the bro-event-bif be set with a valid path and filename."
  (interactive)
  (let ( (bro-event-name (thing-at-point 'symbol))
         (start-pos)
         (end-pos)
         (bro-event-doc)
         (bro-event-buffer)
        ) ; _let_variable_list
    (message "Looking for %s in %s" bro-event-name bro-event-bif)
    (if (file-exists-p bro-event-bif)
        (progn
          (message "Found valid event.bif file.")
          (setq bro-event-buffer (find-file-noselect bro-event-bif))
          (save-excursion
            ;; switch to a buffer with the event.bif.bro file
            (set-buffer bro-event-buffer)
            ;; search for the string
            (if (search-forward (format "global %s: event" bro-event-name) nil 1)
                (progn
                  (end-of-line)
                  (setq end-pos (point))
                  (re-search-backward "^[^#]" nil t 2)
                  (setq start-pos (+ 1 (point)))
                  (setq bro-event-doc (buffer-substring start-pos end-pos))
                  (with-output-to-temp-buffer "bro-event"
                    (princ (format "%s" bro-event-doc)))
                  (save-window-excursion
                    (save-excursion
                      (switch-to-buffer "bro-event")
                      (setq buffer-read-only nil)
                      (bro-mode)))
                  (kill-buffer bro-event-buffer)
                  ) ; _progn
              (message "unable to find the event specified"))
            ) ; _save-excursion
          ) ; _progn
      (message "Did not find valid event.bif file.")
      )
    ) ; _let
  ) ; _defun

(provide 'bro-mode)
  
