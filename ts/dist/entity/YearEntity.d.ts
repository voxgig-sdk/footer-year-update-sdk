import { FooterYearUpdateEntityBase } from '../FooterYearUpdateEntityBase';
import type { FooterYearUpdateSDK } from '../FooterYearUpdateSDK';
import type { Control } from '../types';
import type { Year, YearLoadMatch } from '../FooterYearUpdateTypes';
declare class YearEntity extends FooterYearUpdateEntityBase<Year> {
    constructor(client: FooterYearUpdateSDK, entopts: any);
    make(this: YearEntity): YearEntity;
    load(this: any, reqmatch?: YearLoadMatch, ctrl?: Control): Promise<YearEntity>;
}
export { YearEntity };
