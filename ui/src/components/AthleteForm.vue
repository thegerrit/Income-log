<template>
  <section class="athlete" id="vAthleteForm">
    <header>
      <button class="accordion-button mdl-button--icon mdl-button mdl-js-button mdl-js-ripple-effect" v-on:click="accordion">
        <i class="material-icons">keyboard_arrow_down</i>
      </button>
      <h3>Atleta</h3>
      <div class="actions">
        <button class="mdl-button--icon mdl-button mdl-js-button mdl-js-ripple-effect" title="Archivar">
            <i class="material-icons">archive</i>
          </button>
        <button class="mdl-button--icon mdl-button mdl-js-button mdl-js-ripple-effect"
        title="Añadir Atleta" v-on:click="clearAthleteForm">
          <i class="material-icons">person_add</i>
        </button>
      </div>
    </header>
    <div class="accordion">
    <div class="content"><!-- action="#"-->

      <div class="row">
        <md-field>
          <label>Cédula</label>
          <md-input v-model="athlete.Cedula" type="number"></md-input>
        </md-field>
        <md-field>
          <label>Nombre</label>
          <md-input v-model="athlete.Nombre"></md-input>
        </md-field>
      </div>

      <div class="row">
        <md-field>
          <label>Apellidos</label>
          <md-input v-model="athlete.Apellidos"></md-input>
        </md-field>
        <md-field>
          <label>Correro Electrónico</label>
          <md-input v-model="athlete.Correo"></md-input>
        </md-field>
      </div>

      <div class="row">
        <md-field>
          <md-select v-model="athlete.selectedDiscipline" :options="disciplines" placeholder="Deporte">
            <md-option v-for="discipline in disciplines"
              :value="discipline.value"
              :key="discipline.value">
                {{ discipline.label }}
              </md-option>
          </md-select>
        </md-field>
        <md-field>
          <md-select v-model="athlete.selectedProgram" :options="programs" placeholder="Paquete">
            <md-option v-for="program in programs"
              v-bind:value="program.value"
              v-bind:key="program.value">
                {{ program.label }}
              </md-option>
          </md-select>
        </md-field>
      </div>

      <div class="row">
        <md-field>
          <md-select v-model="athlete.selectedCoach" :options="coaches" placeholder="Entrenador">
            <md-option v-for="coach in coaches"
              v-bind:value="coach.value"
              v-bind:key="coach.value">
                {{ coach.label }}
              </md-option>
          </md-select>
        </md-field>
      </div>

      <div class="save-or-clear" v-bind:class="{ visible : athlete.Cedula }"> <!--TODO: bind class to cedula so buttons are visible and enabled when cedula has a value-->
        <button class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect save-button"
        title="Guardar atleta" :disabled="athlete.Cedula == ''" v-on:click="validateAthleteForm">
          <i class="material-icons">save</i>
        </button>
        <button class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect clear-button"
        title="Borrar atleta" :disabled="athlete.Cedula == ''">
          <i class="material-icons">clear</i>
        </button>
      </div>
    </div>
  </div>
  </section>
</template>

<script>
import Vue from "vue";
import VueSelect from "vue-select";
import { MdField } from "vue-material/dist/components";

Vue.use(MdField);
Vue.component('v-select', VueSelect);

export default {
  name: "AthleteForm",
  props: {
    disciplines: {
      type: Array,
      required: true
    },
    coaches: {
      type: Array,
      required: true
    },
    programs: {
      type: Array,
      required: true
    },
    athlete: {
      type: Object
    },
  },
  methods: {
    accordion: function () {
      var panel= event.target.parentElement.parentElement.nextElementSibling;
      if (panel.style.maxHeight !== "0px"){
        panel.style.overflow = "hidden";
        panel.style.maxHeight = 0;
      }
      else {
        /*function makeVisible(){
          panel.style.overflow = "visible";
        };*/
        panel.style.maxHeight = panel.scrollHeight + "px";
        setTimeout(function(){ panel.style.overflow = "visible"; }, 500);
      }
    },
    validateAthleteForm: function () {
      var ced = this.athlete.Cedula;
      if (ced === ''){
        alert("Porfavor, inserte la cédula del atleta.")
        return
      };

      var nom = this.athlete.Nombre;
      if (nom === ''){
        alert("Porfavor, inserte el nombre del atleta.")
        return
      };
      for (var i=0; i<nom.length;i++){
        /* charcodes for reference:
          ü-252; é-233; á-225; í-237; ó-243; ú-250; ñ-241; Ñ-209; Á-193; É-201;
          Í-205; Ó-211; Ú-218; Ü-220
        */
        var p = nom.charCodeAt(i);
        if (p > 122 && p != 193 && p != 201 && p != 205 && p != 209 && p != 211
          && p != 218 && p != 220 && p != 225 && p != 233 && p != 237 &&
          p != 241 && p != 243 && p != 250 && p != 252||
          p < 97 && p > 90 ||
          p < 65 && p != 32){
          alert("El signo '" + nom[i] + "' es inválido para el nombre del atleta.")
          return
        };
      };

      var ape = this.athlete.Apellidos;
      if (ape === ''){
        alert("Porfavor, inserte el apellido del atleta.")
        return
      };
      for (var i=0; i<ape.length;i++){
        var p = ape.charCodeAt(i);
        if (p > 122 && p != 193 && p != 201 && p != 205 && p != 209 && p != 211
          && p != 218 && p != 220 && p != 225 && p != 233 && p != 237 &&
          p != 241 && p != 243 && p != 250 && p != 252||
          p < 97 && p > 90 ||
          p < 65 && p != 32){
          alert("El signo '" + nom[i] + "' es inválido para el nombre del atleta.")
          return
        };
      };

      var cor = this.athlete.Correo;
      if (cor === ''){
        alert("Porfavor, inserte el correo electrónico del atleta.")
        return
      };
      var atpos = cor.indexOf("@");
      var dotpos = cor.lastIndexOf(".");
      if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 > cor.length){
        alert("El correo electrónico del atleta es inválido.")
      }

      var dis = this.athlete.selectedDiscipline;
      if (dis === ''){
        alert("Porfavor, seleccione el deporte del atleta.")
        return
      };

      var pro = this.athlete.selectedProgram;
      if (pro === ''){
        alert("Porfavor, seleccione el paquete del atleta.")
        return
      };

      var coa = this.athlete.selectedCoach;
      if (coa === ''){
        alert("Porfavor, seleccione el entrenador del atleta.")
        return
      };

    },
    clearAthleteForm: function () {
      this.athlete.Cedula = '';
      this.athlete.Nombre = '';
      this.athlete.Apellidos = '';
      this.athlete.Correo = '';
      this.athlete.selectedDiscipline = '';
      this.athlete.selectedProgram = '';
      this.athlete.selectedCoach = '';
    }
  }
}
</script>


<style scoped lang="scss">
/*Shared styles*/
section {
  header{
    background-color: var(--color-section-title);
    box-shadow: 0px 2px 4px grey;
    display: flex;
    justify-content: flex-start;
    align-items: center;
    color: white;
    h3 {
      font-size: 1.2rem;
      margin: 0 0 0 20px;
      text-transform: uppercase;
      margin-right: auto;
    }
    .actions {
    margin-right: 20px;
    margin-left: auto;
    }
    .accordion-button {
      margin-left: 10px;
    }
  }
  .content {
    padding-top: 0;
    padding: 0px 20px 0px 20px;
    transition: max-height 0.5s ease-out;
    .row {
      clear: both;
      .md-field {
        float: left;
        width: 46%;
      }
      .md-field + .md-field {
        float: right;
      }
      .small-select {
        float: left;
        width: 46%;
        input{
          .form-control{
            display: inline;
          }
        }
      }
      .small-select + .small-select {
        float: right;
      }
    }
    .mdl-textfield {
    width: 85%;
    }
    .save-or-clear {
      text-align: right;
      display: block;
      opacity: 0;
      transition: opacity 1s ease-in;
      margin: 15px 0px 15px 0px;
      .clear-button {
        background-color: var(--color-cancel-button);
        color: white;
        margin-left: 10px;
        &:hover{
          background-color: var(--color-cancel-button-hover);
        }
      }
      .save-button {
        background-color: #207d7d;
        color: white;
        align-self: flex-end;
        &:hover {
          background-color:#2bbbca;
        }
      }
    }
    .visible{
      opacity: 1 !important;
    }
  }

  .accordion {
    max-height: 550px;
    overflow: visible;
    transition: max-height 0.5s ease-out;
  }
}


</style>
