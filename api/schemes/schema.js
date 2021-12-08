const yup = require('yup')

const schemeSchema = yup.object().shape({
  scheme_name:yup
    .string()
    .typeError('needs to be a string')
    .strict(true)
    .required('name is required')
})

const stepsSchema = yup.object().shape({
  step_number:yup
    .number()
    .typeError('needs to be a number')
    .positive()
    .strict(true)
    .required('step_number is required'),
  instructions:yup
    .string()
    .typeError('needs to be a string')
    .required('instruction is required')
})

module.exports = {
  schemeSchema,
  stepsSchema,
}