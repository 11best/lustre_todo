import component/item.{item}
import gleam/int
import gleam/list
import lustre
import lustre/attribute
import lustre/element.{text}
import lustre/element/html.{button, div, p}
import lustre/event.{on_click}

pub fn main() {
  let app = lustre.simple(init, update, view)
  let assert Ok(_) = lustre.start(app, "#app", Nil)

  Nil
}

pub type Todo {
  Todo(id: String, task: String, is_finished: Bool)
}

pub type Model {
  Model(count: Int, todo_list: List(Todo))
}

fn init(_flags) -> Model {
  Model(0, [])
}

pub type Msg {
  Increment
  Decrement
  //   AddTodo
  // RemoveTodo
  // FinishTodo
}

pub fn update(model: Model, msg: Msg) -> Model {
  case msg {
    Increment -> Model(..model, count: model.count + 1)
    Decrement ->
      Model(count: model.count - 1, todo_list: list.drop(model.todo_list, 1))
  }
}

pub fn view(model: Model) -> element.Element(Msg) {
  let count = int.to_string(model.count)

  div([], [
    item(),
    button([attribute.class("bg-green-500"), on_click(Increment)], [text("+")]),
    text(count),
    button([on_click(Decrement)], [text("-")]),
  ])
}
