I compile useful emacs key-bindings I often forget

## built-in
`C-c C-e` execute current elisp line
`C-x k` kill current buffer
`C-x 0` kill current pane
`C-x 1` kill all pane except the current one
`C-x 2` split pane horizontally
`C-x 3` split pane vertically

## dired
`C-x C-d` launch dired
`C-x C-q` edit mode
`o` open a file in a new window
`d` and `x` mark delete and execute
`g` refresh
`M-x find-name-dired` search for file names with a pattern like like *.org

## magit
`C-x g` launch magit
`c c` and `C-c C-c` launch commit message panel and commit
`g` refresh

## projectile
`C-c p` launch projectile prefix panel
`C-c p-s s` counsel-projectile-ag

## multilple cursors
`C-c m c` multiple lines
`M-x mc/mark-all-like-this` mark all like this 

## org-mode
- List
	- `M-ret` insert an item at the current level
	- `M-S-right` increase indentation of an item
	- `C-c -` circulate the current level between different itemize/enumerate bullets (+, - , 1., ...)
	- `C-c C-c` toggle check box
- Priority
	- `C-c ,` to mark priority
	- `S-up` up a priority level
- To-do
	- `S-right`cycle through states
	- `C-c` update [0/0]
- Time stamp
	- `C-.` create timestamp
	- `C-c C-d` set deadline timestamp
	- `C-c C-s` set schedule timestamp
- Agenda
	- `M-x org-agenda`
	- `C-c [` add current file to agenda
## elpy

