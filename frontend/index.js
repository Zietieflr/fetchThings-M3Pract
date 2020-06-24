let $form = document.getElementById('cartoon-form')
const $ul = document.getElementById('cartoons-list')
let baseURL = 'http://localhost:3000/cartoons'

$form.addEventListener('submit', submitHandler)

fetch(baseURL)
  .then(response => response.json())
  .then(showCartoons)

// the event being passed is IMPLICIT for Event Listeners don't have to pass it in
function submitHandler(event) {
  event.preventDefault()

  // anytime you see a 'new' its a class in JS
  let $formData = new FormData($form) //could also do event.target
  let name = $formData.get('name')
  let imageURL = $formData.get('image_url')
  let cartoon = {
    name, 
    image_url: imageURL
  }

  createLi(cartoon)

  //second argument is the Request Option, they are an Object
  fetch(baseURL, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({cartoon})
  })
}

function showCartoons(cartoons) {
  cartoons.forEach(createLi)
}

function createLi(cartoon) {
  //optimistic rendering, when you give user feedback before you have fully finished running the backend
  // as soon as they enter information, display it on the page, so they know something is working. 
  let $h2 = document.createElement('h2')
  let $img = document.createElement('img')
  let $li = document.createElement('li')

  $h2.textContent = cartoon.name
  $img.src = cartoon.image_url
  deleteButton($li, cartoon)

  $li.append($h2, $img)
  $ul.append($li)
}

function deleteButton($li, cartoon) {
  const $button = document.createElement('button')
  $button.value = 'Delete'
  $button.addEventListener('click', event => deleteCartoon($li, cartoon, event))
  $li.append($button)
}

function deleteCartoon($li, cartoon, event) {
  $li.remove()
  fetch(baseURL + `/${cartoon.id}`, {
    method: 'DELETE'
  })
}