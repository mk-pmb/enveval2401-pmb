#!/usr/bin/env node
/* eslint-disable no-unused-vars, no-eval, prefer-const */
'use strict';

require('usnam-pmb');
require('p-fatal');

const parseCeson = require('ceson/parse.js');
const readDataFile = require('read-data-file');
const shq = require('shq');
const toBashDict = require('shq/bonus/dict2bash.js');
const txtrafo = require('txtrafo');

function toBashDictSp(x) { return toBashDict(x, { glue: ' ' }); }
function toBashDictNl(x) { return toBashDict(x, { glue: '\n' }); }

function cjson(x) { return JSON.stringify(x, null, 1).replace(/\n\s*/g, ' '); }

function clog(...args) { console.log(...args); }
Object.assign(clog, {
  json(x) { clog(JSON.stringify(x, null, 2)); },
  cjson(x) { clog(cjson(x)); },
});

function env(k, d) { return process.env[k] || d || ''; }
Object.assign(env, {
  json(k, d) { return JSON.parse(process.env[k] || d || 'null'); },
  ceson(k, d) { return parseCeson(process.env[k] || d || 'null'); },
});

(async function main() {
  let text = env('TEXT');
  let data = env.ceson('DATA');
  let code = env('CODE', "throw new Error('No code given!')");
  eval(code);
}());
