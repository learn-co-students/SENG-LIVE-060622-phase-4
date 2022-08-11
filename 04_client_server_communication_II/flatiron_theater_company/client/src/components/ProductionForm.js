import React, { useState } from "react";
import styled from "styled-components";

function ProductionForm({ addProduction }) {
  const [errors, setErrors] = useState([])
  const [formData, setFormData] = useState({
    title: "",
    genre: "",
    budget: "",
    image: "",
    director: "",
    description: "",
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData({ ...formData, [name]: value });
  };

  function onSubmit(e) {
    e.preventDefault();
    //POST '/productions'

    fetch('/productions', {
      method: "POST",
      headers: {"Content-Type": 'application/json'},
      body: JSON.stringify(formData)
    })
    .then(resp => {
      if (resp.ok){
        resp.json().then(addProduction) // es6 .then will implicity pass the return to addProduction:
        // resp.json().then(production => addProduction(production))
      } else if (resp.status === 404){
        setErrors("404")
      } else {
        resp.json().then(data => {
          debugger
        })
      }
    })
  }

  if (errors === "404") {
    return <img alt="404 image" src="https://www.elegantthemes.com/blog/wp-content/uploads/2020/02/000-404.png"/>
  }

  return (
    <div className="App">
      {errors ? errors.map((e) => <div>{e}</div>) : null}
      <Form onSubmit={onSubmit}>
        <label>Title </label>
        <input
          type="text"
          name="title"
          value={formData.title}
          onChange={handleChange}
        />

        <label> Genre</label>
        <input
          type="text"
          name="genre"
          value={formData.genre}
          onChange={handleChange}
        />

        <label>Budget</label>
        <input
          type="number"
          name="budget"
          value={formData.budget}
          onChange={handleChange}
        />

        <label>Image</label>
        <input
          type="text"
          name="image"
          value={formData.image}
          onChange={handleChange}
        />

        <label>Director</label>
        <input
          type="text"
          name="director"
          value={formData.director}
          onChange={handleChange}
        />

        <label>Description</label>
        <textarea
          type="text"
          rows="4"
          cols="50"
          name="description"
          value={formData.description}
          onChange={handleChange}
        />

        <input type="submit" value="Update Production" />
      </Form>
    </div>
  );
}

export default ProductionForm;

const Form = styled.form`
  display: flex;
  flex-direction: column;
  width: 400px;
  margin: auto;
  font-family: Arial;
  font-size: 30px;
  input[type="submit"] {
    background-color: #42ddf5;
    color: white;
    height: 40px;
    font-family: Arial;
    font-size: 30px;
    margin-top: 10px;
    margin-bottom: 10px;
  }
`;
