import _ from 'lodash';


export class UpdateReducer {
    reduce(json, state) {
        let data = _.get(json, 'update', false);
        if (data) {
            this.reduceDocs(_.get(data, 'docs', false), state);
        }
    }

    reduceDocs(docs, state) {
        if (docs) {
            state.docs = {...docs, ...state.docs};
        }
    }
}
