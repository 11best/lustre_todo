import component/item.{item}
import gleam/int
import lustre
import lustre/attribute
import lustre/element.{text}
import lustre/element/html.{button, div, img, p}
import lustre/event.{on_click}

pub fn main() {
  let app = lustre.simple(init, update, view)
  let assert Ok(_) = lustre.start(app, "#app", Nil)

  Nil
}

fn init(_flags) {
  0
}

type Msg {
  Incr
  Decr
}

fn update(model, msg) {
  case msg {
    Incr -> model + 1
    Decr -> model - 1
  }
}

fn view(model) {
  let count = int.to_string(model)

  div([], [
    item(),
    button([on_click(Incr)], [text(" + ")]),
    p([attribute.class("text-green-400")], [text(count)]),
    button([on_click(Decr)], [text(" - ")]),
    img([attribute.src("https://cdn2.thecatapi.com/images/b7k.jpg")]),
  ])
}
