<template>


    <md-content class="table-container md-scrollbar">
      <table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
        <tr>
          <th v-for="vcells0 in vheader"> {{vcells0.text}}</th>
        </tr>
        <tr v-for="row in rows" v-on:click="rowClick" :key="rows.id">
          <td v-for="cell in row">{{cell.text}}</td>
        </tr>
      </table>
    </md-content>

</template>
<script>
import Vue from "vue";
import { MdContent } from "vue-material/dist/components";
export default {
  name: "DataTable",
  props: {
    vheader: {
      type: Array,
      required: true
    },
    rows: {
      type: Array,
      required: true
    },
    rowClick: {
      type: Function,
    }
  },
  data () {
    return {
      selectedRow: ''
    }
  }
};

</script>


<style scoped lang="scss">
  .table-container{
    width: 96%;
    overflow: auto;
    margin-left: 2%;
    table{
      width: 100%;
    }
  }
  /*Shared Styles*/
  .mdl-data-table {
    th{
      background-color: var(--color-table-header);
      color: var(--text-color-table-header);
      border-bottom: 2px solid var(--border-table-header);
    }
    tr{
      &:nth-child(even){
        background-color: var(--color-table-even-row);
      }
      &:hover{
        background-color: var(--color-table-hover);
      }
    }

  }
  .table-container{ /*search-table and spreadsheet in overview.css*/
    border: 5px solid #207d7d;
    border-radius: 4px;
    box-shadow: 2px 2px 4px #2196f3;
    overflow-x: auto;
    padding: 0;
    max-height: 56vh;
  }
</style>
