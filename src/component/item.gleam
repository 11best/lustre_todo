import lustre/attribute
import lustre/element.{text}
import lustre/element/html.{p}

pub fn item() {
  p([attribute.class("text-red-400")], [text("HI")])
}
