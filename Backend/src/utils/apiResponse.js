// Centralised success-response formatter -> consistent JSON shape everywhere.
export function sendSuccess(res, { statusCode = 200, message = 'OK', data = undefined, meta = undefined } = {}) {
  const body = { success: true, message };
  if (data !== undefined) body.data = data;
  if (meta !== undefined) body.meta = meta;
  return res.status(statusCode).json(body);
}
