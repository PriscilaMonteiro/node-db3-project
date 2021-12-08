const db = require('../../data/db-config')
const Scheme = require('./scheme-model')
const {schemeSchema, stepsSchema} = require('./schema')




/*
  If `scheme_id` does not exist in the database:

  status 404
  {
    "message": "scheme with scheme_id <actual id> not found"
  }
*/


// async function checkSchemeId (req, res, next) {
//   try{
//     const { scheme_id } = req.params
//     const scheme = await Scheme.findById(scheme_id)
//     if(scheme){
//       req.scheme = scheme
//       next()
//     } else {
//       next({ status:404, message: `scheme with scheme_id ${scheme_id} not found`})
//     }
//   } catch (err) {
//     next(err);
//   }
// }
const checkSchemeId = async (req, res, next) => {
  try {
    const existing = await db('schemes')
      .where('scheme_id', req.params.scheme_id)
      .first()
    if(!existing) {
      next({
        status:404,
        message:`scheme with scheme_id ${req.params.scheme_id} not found`,
      })
    } else {
      next()
    }
  } catch (err) {
    next(err)
  }
}

/*
  If `scheme_name` is missing, empty string or not a string:

  status 400
  {
    "message": "invalid scheme_name"
  }
*/

async function validateScheme(req, res, next) {
  try {
    const validated = await schemeSchema.validate(
      req.body,
      { strict: false, stripUnknown: true }
    )
    req.body = validated
    next();
  } catch (err) {
    next({ message: `invalid scheme_name`, status: 400 });
  }
}


/*
  If `instructions` is missing, empty string or not a string, or
  if `step_number` is not a number or is smaller than one:

  status 400
  {
    "message": "invalid step"
  }
*/
async function validateStep(req, res, next) {
  try {
    const validated = await stepsSchema.validate(
      req.body,
      { strict: false, stripUnknown: true }
    )
    req.body = validated
    next();
  } catch (err) {
    next({ message: `invalid step`, status: 400 });
  }
}

module.exports = {
  checkSchemeId,
  validateScheme,
  validateStep,
}
