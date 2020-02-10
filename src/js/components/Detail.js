import React from "react";
import _ from "lodash";

export function Detail({ docs, xkey, name }) {
  const doc = docs && xkey && docs[xkey];
  const src = _.get(doc, "src", "");
  const sample = _.get(doc, "pats.sample", "");
  const product = _.get(doc, "pats.product", "");
  const file = _.get(doc, "spot.path", "");
  return (
    <div class="flex">
      <div className="p4" style={{ width: "50%" }}>
        <h3>{name}</h3>
        <h5>Sample</h5>
        <code>{sample}</code>
        <h5>Product</h5>
        <code>{product}</code>
      </div>
      <div>
        <h4>Source ({file})</h4>
        <code style={{ whiteSpace: "pre-wrap" }}>{src}</code>
      </div>
    </div>
  );
}
