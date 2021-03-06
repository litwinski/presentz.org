###
Presentz.org - A website to publish presentations with video and slides synchronized.

Copyright (C) 2012 Federico Fissore

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
###

"use strict"

draw_boxes = (number_of_boxes) ->
  return (chunk, context, bodies) ->
    boxes = context.current()
    for box, index in boxes
      chunk = chunk.render bodies.block, context.push(box)
      if (index + 1) % number_of_boxes is 0
        chunk = chunk.write "<div class=\"clear\"></div>"
    chunk

onebased = (chunk, context, bodies) ->
  chunk.write context.stack.index + 1
  chunk

if exports?
  root = exports
else
  root = (@dustjs_helpers = {})

root.draw_boxes = draw_boxes
root.onebased = onebased