let getCount = 1;
let postCount = 1;

export default function handler(req, res) {
  return answers(req, res);
}

function answers(req, res) {
  switch (req.method) {
    case "GET":
      return res.status(200).json({
        id: getCount++,
        message: "API is working successfully",
      });
      break;
    case "POST":
      const { data } = req.body;
      return res.status(200).json({
        id: postCount++,
        message:
          "You know it worked when the data below is exatcly what you sent:",
        data: data,
      });
      break;
    default:
      return res.status(404);
  }
}