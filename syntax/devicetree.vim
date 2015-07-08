" Vim syntax file
" Language: coreboot devicetree.cb files
" Maintainer: Martin L Roth <gaumless@gmail.com>
" Version: 0.1

if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "devicetree"

syn case match

syn keyword devicetreeTodo           contained TODO FIXME XXX NOTE

syn match   devicetreeComment        display '#.*$' 
                                     \ contains=devicetreeTodo,
                                     \          devicetreeSpaceError

syn region  devicetreeString          start=/"/ skip=/\\"/ end=/"/

syn match   devicetreeNumber         '[A-Fa-f0-9\.]\+'
syn match   devicetreeNumber         '0x[A-Fa-f0-9\.]\+'

syn match   devicetreeDir            contained '[A-Za-z0-9\/_-]\+'

" devicetree keywords
syn keyword devicetreeKeyword         chip
                                     \ nextgroup=devicetreeDir
                                     \ skipwhite

syn keyword devicetreeKeyword        device
                                     \ nextgroup=devicetreeDevicetypes
                                     \ skipwhite

syn keyword devicetreeKeyword        drq end irq io inherit ioapic_irq register
                                     \ subsystemid

syn keyword devicetreeDevicetypes   cpu cpu_cluster domain i2c ioapic lapic pci
                                    \ pnp
                                    \ contained

syn keyword devicetreeIrqRoute      INTA INTB INTC INTD

syn keyword devicetreeOn on

syn keyword devicetreeOff off

" colors
hi def link devicetreeTodo                 Todo
hi def link devicetreeComment              Comment
hi def link devicetreeDir                  Constant
hi def link devicetreeString               Constant
hi def link devicetreeNumber               Constant
hi def link devicetreeIrqRoute             Identifier
hi def link devicetreeDevicetypes          Identifier
hi def link devicetreeKeyword              Keyword

" arbritrary different colors for 'on' and 'off'
hi def link devicetreeOn                   Type
hi def link devicetreeOff                  PreProc
