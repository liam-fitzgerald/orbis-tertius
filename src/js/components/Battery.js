import React from "react";
import _ from "lodash";

export function Battery({ battery, onSelect }) {
  const unchaptered = battery[""];
  const chapters = _.filter(battery, (chapter, name) => name.length !== 0);
  return (
    <ul>
      {unchaptered &&
        _.map(unchaptered, (xkey, name) => (
          <li onClick={() => onSelect(xkey, name)}>{name}</li>
        ))}
      {_.map(chapters, (chapter, name) => (
        <details>
          <summary>{name}</summary>
          {_.map(chapter, (xkey, name) => (
            <li onClick={() => onSelect(xkey, name)}>{name}</li>
          ))}
        </details>
      ))}
    </ul>
  );
}
