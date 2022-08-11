import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import styled from "styled-components";

function EditProductionForm({ updateProduction }) {
  const [errors, setErrors] = useState([])
  const [formData, setFormData] = useState({
    title: "",
    genre: "",
    budget: "",
    image: "",
    director: "",
    description: "",
  });

  //  a hook provided to us by the react router DOM 
  const { id } = useParams();


  useEffect(() => {
    fetch(`/productions/${id}`)
      .then((res) => res.json())
      .then(setFormData);
  }, [id]);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData({ ...formData, [name]: value });
  };

  function onSubmit(e) {
    e.preventDefault();
    //PATCH to `/productions/${id}`
    fetch(`/productions/${id}`, {
      method: "PATCH",
      headers: {'Content-Type': 'application/json'},
      body: JSON.stringify(formData)
    })
    .then(resp => {
      if (resp.ok) { // if request was successful
        resp.json().then(production => updateProduction(production))
      } else {
        // we need to retain error messages in state
        resp.json().then(data => setErrors(data.errors))
      }
    })
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

export default EditProductionForm;

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
